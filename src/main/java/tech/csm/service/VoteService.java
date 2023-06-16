package tech.csm.service;

import java.util.List;

import tech.csm.model.Post;
import tech.csm.model.User;
import tech.csm.model.Vote;

public interface VoteService {

	Vote saveVote(Vote vote);

	Vote checkUserVote(User user, Post post);

	List<Object> getAllVote();

}
