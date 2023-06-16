package tech.csm.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "users")
public class User implements Serializable {
//	user_id, password, user_name, user_phone, user_email, user_role
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Integer userId;

	@Column(name = "password")
	private String password;

	@Column(name = "user_name")
	private String userName;

	@Column(name = "user_phone")
	private String phoneNo;

	@Column(name = "user_email")
	private String userMail;

	@Column(name = "user_role")
	private String userRole;

}
