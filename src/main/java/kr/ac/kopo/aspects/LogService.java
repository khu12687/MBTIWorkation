package kr.ac.kopo.aspects;

import kr.ac.kopo.model.Member;

public interface LogService {

	void logFalse(Member member, boolean result);

	Member loginCheck(Member member);

}
