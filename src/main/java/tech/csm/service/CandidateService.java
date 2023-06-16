package tech.csm.service;

import java.util.List;

import tech.csm.model.Candidate;

public interface CandidateService {

	List<Candidate> getAllCandidate();

	Candidate saveCandidate(Candidate candidate);

	void deleteByCandidateId(Integer candidateId);

	Candidate getCandidateById(Integer candidateId);

	List<Candidate> getCandidateByPost(Integer postId);

}
