package com.railway.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
@Entity
public class Ticket implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ticketID;
	private int noOfTickets;
	private int amountPaid;
	@ManyToOne(fetch = FetchType.EAGER)
	private User userId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Train trainId;
	@OneToMany(mappedBy = "ticketId",cascade = CascadeType.ALL,fetch = FetchType.EAGER,orphanRemoval = true)
	private List<Passenger> listOfPassenger=new ArrayList<>();
	@Override
	public String toString() {
		return "Ticket [ticketID=" + ticketID + ", noOfTickets=" + noOfTickets + ", amountPaid=" + amountPaid
				+ ", userId=" + userId + ", trainId=" + trainId + ", listOfPassenger=" + listOfPassenger + "]";
	}
	public User getUserId() {
		return userId;
	}
	public void setUserId(User userId) {
		this.userId = userId;
	}
	public Train getTrainId() {
		return trainId;
	}
	public void setTrainId(Train trainId) {
		this.trainId = trainId;
	}
	
	
	public int getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(int amountPaid) {
		this.amountPaid = amountPaid;
	}
	public List<Passenger> getListOfPassenger() {
		return listOfPassenger;
	}
	public void setListOfPassenger(List<Passenger> listOfPassenger) {
		this.listOfPassenger = listOfPassenger;
	}
	public int getTicketID() {
		return ticketID;
	}
	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}
	public int getNoOfTickets() {
		return noOfTickets;
	}
	public void setNoOfTickets(int noOfTickets) {
		this.noOfTickets = noOfTickets;
	}
	
	

}
