package dao;
import java.util.List;

import entities.*;

public interface OrderDao {
	public void SaveOrder(Orders od);
	public List<Orders> getAll();
}
