package tech.csm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tech.csm.model.Candidate;
import tech.csm.model.Post;
import tech.csm.model.User;
import tech.csm.model.Vote;
import tech.csm.service.CandidateService;
import tech.csm.service.PostService;
import tech.csm.service.UserService;
import tech.csm.service.VoteService;

@Controller
public class Runner {

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private CandidateService candidateService;
	@Autowired
	private VoteService voteService;

	@GetMapping("/homepage")
	public String welcome(Model model) {
		return "demo";
	}

	@GetMapping("/login")
	public String login(Model model) {

		model.addAttribute("login", "yes");
		return "demo";
	}

	@GetMapping("/logout")
	public String logout(Model model) {

		return "redirect:./login";
	}

	@PostMapping("/loginValidate")
	private String loginValidate(@RequestParam("userId") Integer userId, @RequestParam("password") String password,
			RedirectAttributes rd, Model model, HttpServletRequest req) {

		HttpSession session = req.getSession();

		User user = userService.getUserByUserId(userId);

		if (user != null) {
			if (user.getPassword().equals(password)) {
				session.setAttribute("userSession", user);
				model.addAttribute("user", user);
				if (user.getUserRole().equals("admin")) {
					return "welcomeAdmin";
				} else {
					return "welcomeUser";
				}

			} else {
				rd.addFlashAttribute("msg", "Wrong Password");
				return "redirect:./homepage";
			}
		} else {
			rd.addFlashAttribute("msg", "Invalid userid");
			return "redirect:./homepage";
		}
	}

	@GetMapping("/addNewUser")
	public String addNewuser(Model model) {
		model.addAttribute("newUser", "yes");
		return "demo";
	}

	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute User user, RedirectAttributes rd) {
		user = userService.saveUser(user);

		rd.addFlashAttribute("msg", "User Saved with id : " + user.getUserId());
		return "redirect:./addNewUser";

	}

	@GetMapping("/viewUser")
	public String viewUser(Model model) {
		List<User> userList = userService.getAllUser();
		model.addAttribute("userList", userList);

		return "welcomeAdmin";
	}

	@GetMapping("/welcomeUser")
	public String welcomeUser(@RequestParam("uid") User user, Model model, HttpServletRequest req) {

		req.getSession().setAttribute("userSession", user);

		return "welcomeUser";
	}

	@GetMapping("/postTable")
	public String post(Model model) {

		model.addAttribute("postList", postService.getAllPost());

		return "welcomeAdmin";
	}

	@PostMapping("/savePost")
	public String savePost(@ModelAttribute Post post, RedirectAttributes rd) {
		Post p = postService.savePost(post);

		rd.addFlashAttribute("msg", "Post saved with id : " + p.getPostId());

		return "redirect:./postTable";
	}

	@GetMapping("/deletePost")
	public String deletePost(@RequestParam("postId") Integer postId, RedirectAttributes rd) {
		postService.deletePostById(postId);
		rd.addFlashAttribute("deletemsg", "Post deleted");
		return "redirect:./postTable";
	}

	@GetMapping("/editPost")
	public String editPost(@RequestParam("postId") Integer postId, Model model) {
		Post post = postService.getPostById(postId);
		model.addAttribute("post", post);
		model.addAttribute("postList", postService.getAllPost());
		return "welcomeAdmin";
	}

	@GetMapping("/candidateTable")
	public String candidate(Model model) {
		model.addAttribute("candidateList", candidateService.getAllCandidate());
		return "welcomeAdmin";
	}

	@PostMapping("/saveCandidate")
	public String saveCandidate(@ModelAttribute Candidate candidate, RedirectAttributes rd) {
		Candidate c = candidateService.saveCandidate(candidate);
		if (c != null)
			rd.addFlashAttribute("candimsg", "Candidate saved with id : " + c.getCandidateId());
		return "redirect:./candidateTable";
	}

	@GetMapping("/deleteCandidate")
	public String deleteCandidate(@RequestParam("candidateId") Integer candidateId, RedirectAttributes rd) {

		candidateService.deleteByCandidateId(candidateId);
		rd.addFlashAttribute("deletemsg", "Candidate deleted");

		return "redirect:./candidateTable";
	}

	@GetMapping("/editCandidate")
	public String editCandidate(Model model, @RequestParam("candidateId") Integer candidateId) {

		Candidate candidate = candidateService.getCandidateById(candidateId);
		model.addAttribute("candidateList", candidateService.getAllCandidate());
		model.addAttribute("candidate", candidate);
		return "welcomeAdmin";
	}

	@GetMapping("/changePassword")
	public String changePassword(Model model) {
		model.addAttribute("cp", "cp");
		return "welcomeUser";
	}

	@PostMapping("/updatePassword")
	public String updatePassword(@RequestParam("userId") Integer userId,
			@RequestParam("oldPassword") String oldPassword, @RequestParam("confirm_pass") String newPassword,
			RedirectAttributes rd) {

		User user = userService.getUserByUserId(userId);
		System.out.println(oldPassword);
		System.out.println(user.getPassword());
		if (user.getPassword().equals(oldPassword)) {

			user.setPassword(newPassword);

			user = userService.saveUser(user);

			rd.addFlashAttribute("msg", "Password updated : " + user.getPassword());
		} else {
			rd.addFlashAttribute("pc", "Wrong Password");
		}

		return "redirect:./changePassword";
	}

	@GetMapping("/editUser")
	public String editProfile(Model model) {
		model.addAttribute("editprofile", "editprofile");
		return "welcomeUser";
	}

	@PostMapping("/updateUser")
	public String updateUser(RedirectAttributes rd, @RequestParam("userId") Integer userId,
			@RequestParam("userName") String userName, @RequestParam("phoneNo") String phoneNo,
			@RequestParam("userMail") String userMail, @RequestParam("userRole") String userRole) {

		User user = userService.getUserByUserId(userId);

		user.setUserName(userName);
		user.setPhoneNo(phoneNo);
		user.setUserMail(userMail);
		user.setUserRole(userRole);

		user = userService.saveUser(user);

		rd.addFlashAttribute("msg", "User updated!! It will reflect on relogin");
		return "redirect:./editUser";
	}

	// Cast Vote

	@GetMapping("/castVote")
	public String castVote(Model model) {

		List<Post> postList = postService.getAllPost();
		System.out.println(postList);
		model.addAttribute("postList", postList);
		model.addAttribute("castVote", "castVote");
		return "welcomeUser";
	}

	@GetMapping("/getCandidate")
	public void getCandidate(@RequestParam("postId") Integer postId, HttpServletResponse resp) throws IOException {
		List<Candidate> candidateList = candidateService.getCandidateByPost(postId);

		String re = "<option value='0'>-Select-</option>";
		for (Candidate c : candidateList) {
			re += "<option value='" + c.getCandidateId() + "'>" + c.getCandidateId() + "</option>";
		}
		resp.getWriter().print(re);
	}

	@PostMapping("/saveVote")
	public String saveVote(@RequestParam("userId") User user, @RequestParam("postId") Post post,
			@RequestParam("candidate") Candidate candidate, RedirectAttributes rd) {

		Vote vote = new Vote();

		vote.setUser(user);
		vote.setPost(post);
		vote.setCandidate(candidate);

		Vote checkUser = voteService.checkUserVote(user, post);

		if (checkUser == null) {
			vote = voteService.saveVote(vote);
			rd.addFlashAttribute("msg", "Vote SuccessFull");
		} else {
			rd.addFlashAttribute("msg", "Already Voted");
		}

		return "redirect:./castVote";
	}

	// View Winners

	@GetMapping("/viewWinners")
	public String viewWinners(Model model) {

		model.addAttribute("voteList", voteService.getAllVote());
		return "welcomeAdmin";
	}

}