package org.csu.pms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.csu.pms.dao.AdviceDao;
import org.csu.pms.dao.CarDao;
import org.csu.pms.dao.ConsumeDao;
import org.csu.pms.dao.HouseDao;
import org.csu.pms.dao.HouseTypeDao;
import org.csu.pms.dao.NoticeDao;
import org.csu.pms.dao.RepairDao;
import org.csu.pms.dao.UserDao;
import org.csu.pms.domain.Advice;
import org.csu.pms.domain.Car;
import org.csu.pms.domain.Consume;
import org.csu.pms.domain.House;
import org.csu.pms.domain.HouseType;
import org.csu.pms.domain.Notice;
import org.csu.pms.domain.PageVO;
import org.csu.pms.domain.Repair;
import org.csu.pms.domain.User;
import org.csu.pms.service.PmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.bcel.internal.generic.RETURN;

@Service("pmsService")
public class PmsServiceImpl implements PmsService{

	@Autowired	
	private UserDao userDao;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private ConsumeDao consumeDao;
	
	@Autowired
	private RepairDao repairDao;
	
	@Autowired
	private AdviceDao adviceDao;
	
	@Autowired
	private HouseDao houseDao;
	
	@Autowired
	private CarDao carDao;
	
	@Autowired
	private HouseTypeDao houseTypeDao;
	
	@Override
	public User login(String userId, String password) {
		// TODO Auto-generated method stub
		return userDao.selectByUserIdAndPassword(userId, password);
	}
	@Override
	public PageVO<Notice> listNotice(int pageNo, int rowMax) {
		// TODO Auto-generated method stub
		PageVO<Notice> page = new PageVO<Notice>();
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		int flag=noticeDao.countAll();
		page.setTotal(flag);
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		List<Notice> lst = noticeDao.selectAll(start, rowMax);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public Notice selectNewsItem(String noticeTitle) {
		// TODO Auto-generated method stub
		return noticeDao.selectNewsItem(noticeTitle);
	}
	@Override
	public List<Notice> selectTopThree() {
		// TODO Auto-generated method stub
		return noticeDao.selectTopThree();
	}
 
	@Override
	public List<Notice> getNoticeTwo() {
		// TODO Auto-generated method stub
		return noticeDao.getNoticeTwo();
	}
	@Override
	public Notice getMissing() {
		// TODO Auto-generated method stub
		return noticeDao.getMissing();
	}
	@Override
	public PageVO<User> listUser(User user, int pageNo, int rowMax) {
		PageVO<User> page = new PageVO<User>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("user", user);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(userDao.count(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<User> lst = userDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public User findUserById(String userId) {
		return userDao.selectByUserId(userId);
	}
	@Override
	public void removeUserById(String userId) {
		userDao.deleteByUserId(userId);
		
	}
	@Override
	public void modifyUser(User user) {
		userDao.update(user);
	}
	@Override
	public void addUser(User user) {
		userDao.save(user);	
	}
	@Override
	public PageVO<Consume> listConsume(Consume consume, int pageNo, int rowMax) {
		PageVO<Consume> page = new PageVO<Consume>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("consume", consume);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(consumeDao.count(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<Consume> lst = consumeDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public void addConsume(Consume consume) {
		consumeDao.save(consume);
		
	}
	@Override
	public
	PageVO<Notice> listNotice(Notice notice, int pageNo, int rowMax) {
		PageVO<Notice> page = new PageVO<Notice>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("notice", notice);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(noticeDao.count(params));
		
		
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<Notice> lst = noticeDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public void addNotice(Notice notice) {
		noticeDao.save(notice);
	}
	@Override
	public PageVO<Repair> listRepair(Repair repair, int pageNo, int rowMax) {
		PageVO<Repair> page = new PageVO<Repair>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("repair", repair);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(repairDao.count(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<Repair> lst = repairDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public void addRepair(Repair repair) {
		repairDao.save(repair);
	}
	@Override
	public PageVO<Advice> listAdvice(Advice advice, int pageNo, int rowMax) {
		PageVO<Advice> page = new PageVO<Advice>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("advice", advice);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(adviceDao.count(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<Advice> lst = adviceDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public void addAdvice(Advice advice) {
		adviceDao.save(advice);
	}
	@Override
	public PageVO<House> listHouse(House house, int pageNo, int rowMax) {
		PageVO<House> page = new PageVO<House>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("house", house);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(houseDao.count(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<House> lst = houseDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	
	@Override
	public void addHouse(House house) {
		houseDao.save(house);
		
	}
	@Override
	public PageVO<Car> listCar(Car car, int pageNo, int rowMax) {
		PageVO<Car> page = new PageVO<Car>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("car", car);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(carDao.count(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<Car> lst = carDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public void addCar(Car car) {
		carDao.save(car);		
	}
	@Override
	public PageVO<HouseType> listHouseType(HouseType houseType, int pageNo, int rowMax) {
		PageVO<HouseType> page = new PageVO<HouseType>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("houseType", houseType);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(houseTypeDao.count(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<HouseType> lst = houseTypeDao.selectByPage(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public void addHouseType(HouseType houseType) {
		houseTypeDao.save(houseType);
	}
	@Override
	public void removeHouse(int buildingNum, int roomNum) {
		houseDao.deleteByBuildingNumAndRoomNum(buildingNum, roomNum);
	}
	@Override
	public void modifyHouse(House house) {
		houseDao.update(house);
		
	}
	@Override
	public House findHouse(int buildingNum, int roomNum) {
		return houseDao.findHouseByBuildingNumAndRoomNum(buildingNum, roomNum);
	}
	@Override
	public Car findCarById(String carNum) {
		return carDao.selectByCarNum(carNum);
	}
	@Override
	public void removeCarById(String carNum) {
		carDao.deleteByCarNum(carNum);
	}
	@Override
	public void modifyCar(Car car) {
		carDao.update(car);
	}
	@Override
	public HouseType findHouseType(int houseType) {
		return houseTypeDao.selectByHouseType(houseType);
	}
	@Override
	public void removeHouseType(int houseType) {
		houseTypeDao.deleteByHouseType(houseType);
	}
	@Override
	public void modifyHouseType(HouseType houseType) {
		houseTypeDao.update(houseType);
	}
	@Override
	public void removeNotice(int noticeId) {
		noticeDao.deleteByNoticeId(noticeId);	
	}
	@Override
	public void modifyNotice(Notice notice) {
		noticeDao.update(notice);
	}
	@Override
	public Notice findNotice(int noticeId) {
		return noticeDao.selectById(noticeId);
	}
	@Override
	public void removeRepair(int repairId) {
		repairDao.deleteByRepairId(repairId);
	}
	@Override
	public void modifyRepair(Repair repair) {
		repairDao.update(repair);
	}
	@Override
	public Repair findRepair(int repairId) {
		return repairDao.selectByRepairId(repairId);
	}
	@Override
	public void removeAdvice(int adviceId) {
		adviceDao.deleteByAdviceId(adviceId);
	}
	@Override
	public void modifyAdvice(Advice advice) {
		adviceDao.update(advice);
	}
	@Override
	public Advice findAdvice(int adviceId) {
		return adviceDao.selectByAdviceId(adviceId);
	}
	@Override
	public PageVO<Advice> listAdviceUser(Advice advice, int pageNo, int rowMax) {
PageVO<Advice> page = new PageVO<Advice>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("advice", advice);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(adviceDao.countUser(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<Advice> lst = adviceDao.selectByPageUser(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public Repair selectRepairByIdUser(int repairId) {
		return repairDao.selectByRepairId(repairId);
	}
	@Override
	public PageVO<Repair> listRepairUser(Repair repair, int pageNo, int rowMax) {
		PageVO<Repair> page = new PageVO<Repair>();
		
		Map<String,Object> params = new HashMap<>();
		params.put("repair", repair);
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(repairDao.countUser(params));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		params.put("start", start);
		params.put("rowMax", rowMax);
		List<Repair> lst = repairDao.selectByPageUser(params);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public PageVO<Consume> listConsumeUser(Map<String, Object> map, int pageNo, int rowMax) {
		PageVO<Consume> page = new PageVO<Consume>();
		
		if (pageNo < 1) {
			pageNo = 1;
		} 
		if (rowMax < 1) {
			rowMax = 1;
		}
		
		page.setRowMax(rowMax);
		page.setTotal(consumeDao.countConsumeUser(map));
		if (page.getTotal() == 0) {
			return null;
		}
		page.setPageMax((page.getTotal() - 1)/rowMax + 1);
		if (pageNo > page.getPageMax()) {
			pageNo = page.getPageMax();
		}
		page.setCurrent(pageNo);
		
		int start = (pageNo - 1) * rowMax; 
		map.put("start", start);
		map.put("rowMax", rowMax);
		List<Consume> lst = consumeDao.selectConsumeByPageUser(map);
		page.setRows(lst);
		
		return page;
	}
	@Override
	public void payOneItem(int consumeId) {
		consumeDao.updateConsumeUser(consumeId);
	}
	@Override
	public void change( String password, String phone,String userId) {
		userDao.change(password,phone,userId);
		
	}
	
      
}
