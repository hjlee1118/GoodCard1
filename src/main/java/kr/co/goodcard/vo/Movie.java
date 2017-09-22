package kr.co.goodcard.vo;

public class Movie {
	
	private int movieNo;
	private int movieAmount;
	
	public Movie() {
		
	}
	
	public Movie(int movieNo, int movieAmount) {
		this.movieNo = movieNo;
		this.movieAmount = movieAmount;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getMovieAmount() {
		return movieAmount;
	}

	public void setMovieAmount(int movieAmount) {
		this.movieAmount = movieAmount;
	}

	@Override
	public String toString() {
		return "Movie [movieNo=" + movieNo + ", movieAmount=" + movieAmount + "]";
	}
}
