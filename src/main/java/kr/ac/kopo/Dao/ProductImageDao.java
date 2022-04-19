package kr.ac.kopo.Dao;

import kr.ac.kopo.model.ProductImage;

public interface ProductImageDao {
	void add(ProductImage image);

	boolean delete(int code);
}
