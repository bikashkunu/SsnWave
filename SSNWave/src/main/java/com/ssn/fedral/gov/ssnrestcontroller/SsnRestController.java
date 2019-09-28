package com.ssn.fedral.gov.ssnrestcontroller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Optional;

import javax.websocket.server.PathParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssn.fedral.gov.ssnRepository.SsnRepositorry;
import com.ssn.fedral.gov.ssnentity.SsnMaster;
import com.ssn.fedral.gov.ssnexception.InvalidSsnException;
import com.ssn.fedral.gov.ssnmodel.SsnModel;
import com.ssn.fedral.gov.ssnservice.ISsnService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController

public class SsnRestController {
	// Inject Ssnervice
	@Autowired
	ISsnService ssnservice;
	private static final Logger logger = LoggerFactory.getLogger(SsnRestController.class);

	/**
	 * Method verifyStateName enrollSsn
	 * @param id
	 * @return stateName
	 */
	@ApiOperation(value = "verifyStateName", response = String.class)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "CustemerDetails Recive", response = String.class),
			@ApiResponse(code = 500, message = "Internal Server Error"),
			@ApiResponse(code = 404, message = "State Not Found") })

	@GetMapping(value = "/statename/{id}")
	public ResponseEntity<?> verifyStateName(@PathVariable("id") String id) {
		// Use Service Class
		try { 
			long ssn = Long.parseLong(id);
			logger.debug("**Inside VerifyStateName Method** ");
			SsnModel ssnmodel = ssnservice.findStateName(ssn);
			logger.debug("**After Calling Service Class Method**");
			String stateName = ssnmodel.getState();
			logger.debug("**After Getting State Name**");
			return new ResponseEntity<>(stateName, HttpStatus.OK);

		} catch (Exception e) {
			// TODO: handle exception
			throw new InvalidSsnException("Dont Enter String Value");
		}

	}
}
