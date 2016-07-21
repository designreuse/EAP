package com.journaldev.spring.service;

import java.util.List;

import com.journaldev.spring.model.Message;

public interface MessageService {

	public void addMessage(Message p);
	public void updateMessage(Message p);
	public List<Message> listMessages();
	public List<Message> paginationMessages(int startResult, int maxResult);
	public List<Message> inbox(String addressee_id,int status);
	public Message getMessageById(String id);
	public void removeMessage(String id);
		
}
