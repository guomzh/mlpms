package org.csu.pms.service;

import java.util.List;
import java.util.Map;

import org.csu.pms.domain.Advice;
import org.csu.pms.domain.Car;
import org.csu.pms.domain.Consume;
import org.csu.pms.domain.House;
import org.csu.pms.domain.HouseType;
import org.csu.pms.domain.Notice;
import org.csu.pms.domain.PageVO;
import org.csu.pms.domain.Repair;
import org.csu.pms.domain.User;



public interface PmsService {
	
	//user
    User login(String userId ,String password);
    PageVO<User> listUser(User user, int pageNo, int rowMax);
	
	User findUserById(String userId);	
	void removeUserById(String userId);
	void modifyUser(User user);
	void addUser(User user);
    
    //notice
    PageVO<Notice> listNotice(int pageNO, int rowMax);
    Notice selectNewsItem(String noticeTitle);
    List<Notice> selectTopThree();
    List<Notice> getNoticeTwo();
    Notice getMissing();
    PageVO<Notice> listNotice(Notice notice,int pageNo, int rowMax);
    void addNotice(Notice notice);
    void removeNotice(int noticeId);
	void modifyNotice(Notice notice);
	Notice findNotice(int noticeId);
	
    //consume
    PageVO<Consume> listConsume(Consume consume, int pageNo, int rowMax);
    void addConsume(Consume consume);
    public PageVO<Consume> listConsumeUser(Map<String, Object> map, int pageNo, int rowMax);
    void payOneItem(int consumeId);
    
    //repair
    PageVO<Repair> listRepair(Repair repair, int pageNo, int rowMax);
    void addRepair(Repair repair);
    void removeRepair(int repairId);
	void modifyRepair(Repair repair);
	Repair findRepair(int repairId);
	public Repair selectRepairByIdUser(int repairId);
	public PageVO<Repair> listRepairUser(Repair repair, int pageNo, int rowMax);
    
	//advice
    PageVO<Advice> listAdvice(Advice advice, int pageNo, int rowMax);
    public PageVO<Advice> listAdviceUser(Advice advice, int pageNo, int rowMax);
    void addAdvice(Advice advice);
    void removeAdvice(int adviceId);
	void modifyAdvice(Advice advice);
	Advice findAdvice(int adviceId);
    
	//house
    PageVO<House> listHouse(House house, int pageNo, int rowMax);
    void addHouse(House house);
    void removeHouse(int buildingNum,int roomNum);
	void modifyHouse(House house);
	House findHouse(int buildingNum, int roomNum);
   
	//car
    PageVO<Car> listCar(Car car, int pageNo, int rowMax);
    void addCar(Car car);
    Car findCarById(String carNum);	
	void removeCarById(String carNum);
	void modifyCar(Car car);

    //houseType
    PageVO<HouseType> listHouseType(HouseType houseType, int pageNo, int rowMax);
    void addHouseType(HouseType houseType);
    HouseType findHouseType(int houseType);	
	void removeHouseType(int houseType);
	void modifyHouseType(HouseType houseType);
	void change(String userId, String password, String phone);
    
}