package performance.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.EventboardDTO;
import performance.bean.PerformanceDTO;

public interface PerformanceDAO {

	public List<EventboardDTO> getPerformance();

	public List<EventboardDTO> getPlayList(Map<String,Integer> map);	//공연일정 리스트 가져오는 메소드

	public int getPlayListTotalA();	//공연일정 리스트 총 글수 가져오는 메소드

	public int getExhibitionListTotalA();	// 전시회 일정 리스트 총 글수 가져오는 메소드

	public List<EventboardDTO> getExhibitionList(Map<String, Integer> map);	// 전시회 일정 리스트 가져오는 메소드

	public List<EventboardDTO> getPerformancePlay();

}
