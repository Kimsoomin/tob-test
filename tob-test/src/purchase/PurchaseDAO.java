package purchase;

import java.util.List;

public interface PurchaseDAO {
	// 주문내역 추가
	public int insert(PurchaseVO o);
	// 주문내역 삭제
	public int delete(String purNum);
	
	// purNum으로 조회
	public PurchaseVO selectBypurNum(String purNum);
	
	// Accnum으로 조회
	public List<PurchaseVO> selectByAccNum(String accountNum);
	
	// 전체 주문내역 조회
	public List<PurchaseVO> selectAll();
}
