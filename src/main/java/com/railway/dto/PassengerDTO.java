package com.railway.dto;

import java.io.Serializable;

import com.railway.entities.Passenger;
import com.railway.entities.Ticket;


public class PassengerDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int passengerID;
	private String fullName;
	private String seatPreference;
	private int age;
    private Ticket ticketId;
	
	public Ticket getTicketId() {
		return ticketId;
	}

	public void setTicketId(Ticket ticketId) {
		this.ticketId = ticketId;
	}

	public int getPassengerID() {
		return passengerID;
	}

	public void setPassengerID(int passengerID) {
		this.passengerID = passengerID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getSeatPreference() {
		return seatPreference;
	}

	public void setSeatPreference(String seatPreference) {
		this.seatPreference = seatPreference;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
	public Passenger convertToEntity() {
		Passenger passenger=new Passenger();
		passenger.setFullName(this.fullName);
		passenger.setPassengerID(this.passengerID);
		passenger.setAge(this.age);
		passenger.setSeatPreference(this.seatPreference);
		passenger.setTicketId(this.ticketId);
		return passenger;
	}

	

}
