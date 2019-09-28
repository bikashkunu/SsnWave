package com.ssn.fedral.gov.stateentity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

@Entity(name="USA_STATE")
@Data
public class UsaState {
	@Id
	@GeneratedValue
	@Column(name="STATE_CODE")
	private int stateCode;
	@Column(name="STATE_NAME")
	private String STATENAME;

}
