package com.sist.news;
public class Word {
	private String word;
	private int count=0;
	public void Incerement(){
		count++;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
