package tech.csm.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "vote")
public class Vote implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sl_no")
	private Integer slNo;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "post_id")
	private Post post;

	@ManyToOne
	@JoinColumn(name = "candidate_id")
	private Candidate candidate;
}
