package tech.csm.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "post")
public class Post implements Serializable {

	@Id
	@Column(name = "post_id")
	private Integer postId;

	@Column(name = "post_name")
	private String postName;
}
