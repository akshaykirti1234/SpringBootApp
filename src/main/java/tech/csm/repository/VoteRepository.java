package tech.csm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tech.csm.model.Post;
import tech.csm.model.User;
import tech.csm.model.Vote;

@Repository
public interface VoteRepository extends JpaRepository<Vote, Integer> {

	@Query("from Vote where user=?1 and post=?2")
	Vote checkUserVote(User user, Post post);

	@Query(value = "SELECT p.post_name as postName, candidate_id as candidateId, max(vote_count) as voteCount from (select post_id,candidate_id,count(*) vote_count FROM vote group by post_id,candidate_id order by vote_count desc)v\r\n"
			+ "left join post p on v.post_id=p.post_id group by v.post_id;", nativeQuery = true)
	List<Object> getAllVote();
}
