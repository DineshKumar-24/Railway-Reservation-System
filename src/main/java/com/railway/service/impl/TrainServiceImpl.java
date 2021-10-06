package com.railway.service.impl;

import java.util.List;
import java.util.Optional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railway.entities.Train;
import com.railway.exceptions.CommonTrainException;
import com.railway.repositories.TrainRepository;
import com.railway.service.TrainService;
@Service
public class TrainServiceImpl implements TrainService{
	private static final Logger logger = LogManager.getLogger(TrainServiceImpl.class);
	@Autowired
	TrainRepository trainRepository;
	@Override
	public void createTrain(Train train) {
		Optional<Train> checkingTrain=trainRepository.findById(train.getTrainNo());
		if(checkingTrain.isPresent()) {
			logger.warn("Train No already exist");
			throw new CommonTrainException("E200","Train No Already Exist");
		}
		else {
			trainRepository.save(train);
		}
	}
	@Override
	public List<Train> getAllTrains() {
		
		return trainRepository.findAll();
	}
	@Override
	public void deleteTrain(String id) {
		trainRepository.deleteById(id);
		
	}
	@Override
	public void updateTrain(Train train) throws CommonTrainException{
		Optional<Train> optionalTrain=trainRepository.findById(train.getTrainNo());
		if(optionalTrain.isPresent()) {
		Train oldTrain=optionalTrain.get();
		oldTrain.setTrainName(train.getTrainName());
		oldTrain.setSeat2S(train.getSeat2S());
		oldTrain.setSeatSL(train.getSeatSL());
		oldTrain.setSeatAC(train.getSeatAC());
		oldTrain.setSource(train.getSource());
		oldTrain.setDestination(train.getDestination());
		oldTrain.setArrivalTime(train.getArrivalTime());
		oldTrain.setDepatureTime(train.getDepatureTime());
		oldTrain.setDate(train.getDate());
		trainRepository.save(oldTrain);
		}
		else {
			throw new CommonTrainException("201", "Train Not Found");
		}
		 
	}
	@Override
	public Train getByTrainNo(String trainNo) throws CommonTrainException {
		Optional<Train> optionalTrain=trainRepository.findById(trainNo);
		if(optionalTrain.isPresent()) {
		return optionalTrain.get();
		}
		else {
			logger.warn("Updatin train with {} failed",trainNo);
			throw new CommonTrainException("201", "Train Not Found");
		}
	}
	@Override
	public List<Train> getBySourceAndDestinationAndDate(String source, String destination,String date) {
		return trainRepository.findBySourceAndDestinationAndDate(source, destination, date);
	}
	
	@Override
	public Train getByTrainName(String trainName) {
		
		return trainRepository.findByTrainName(trainName);
	}

}
