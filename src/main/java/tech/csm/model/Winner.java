package tech.csm.model;

public class Winner {
	private String postName;
	private Integer candidateId;
	private Integer voteCount;

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public Integer getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(Integer candidateId) {
		this.candidateId = candidateId;
	}

	public Integer getVoteCount() {
		return voteCount;
	}

	public void setVoteCount(Integer voteCount) {
		this.voteCount = voteCount;
	}

}
