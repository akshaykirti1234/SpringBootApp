package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Candidate;
import tech.csm.repository.CandidateRepository;
import tech.csm.repository.PostRepository;

@Service
public class CandidateServiceImpl implements CandidateService {

	@Autowired
	private CandidateRepository candidateRepository;
	@Autowired
	private PostRepository postRepository;

	@Override
	public List<Candidate> getAllCandidate() {
		return candidateRepository.findAll();
	}

	@Override
	public Candidate saveCandidate(Candidate candidate) {
		return candidateRepository.save(candidate);
	}

	@Override
	public void deleteByCandidateId(Integer candidateId) {
		candidateRepository.deleteById(candidateId);
	}

	@Override
	public Candidate getCandidateById(Integer candidateId) {
		return candidateRepository.findById(candidateId).get();
	}

	@Override
	public List<Candidate> getCandidateByPost(Integer postId) {
		return candidateRepository.findByPost(postRepository.findById(postId).get());
	}

}
