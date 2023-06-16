package tech.csm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.csm.model.Candidate;
import tech.csm.model.Post;

@Repository
public interface CandidateRepository extends JpaRepository<Candidate, Integer> {

	List<Candidate> findByPost(Post post);
}
