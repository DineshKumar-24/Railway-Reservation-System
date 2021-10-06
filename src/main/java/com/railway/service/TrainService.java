package com.railway.service;

import java.util.List;
import com.railway.entities.Train;

public interface TrainService {
	void createTrain(Train train);

	List<Train> getAllTrains();

	Train getByTrainNo(String trainNo);

	void deleteTrain(String id);

	void updateTrain(Train train);

	List<Train> getBySourceAndDestinationAndDate(String source, String destination, String date);

	Train getByTrainName(String name);
}
