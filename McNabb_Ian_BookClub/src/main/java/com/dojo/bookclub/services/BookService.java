package com.dojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dojo.bookclub.models.Book;
import com.dojo.bookclub.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	BookRepository bookRepository;
	
	public Book findbyId(Long id) {
		
		Optional<Book> result = bookRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Book> allBooks(){
		return bookRepository.findAll();
	}
	
	public Book createBook(Book book) {
		return bookRepository.save(book);
	}
	public Book updateBook(Book book) {
		return bookRepository.save(book);
	}
	
	public void deleteBook(Book book) {
		bookRepository.delete(book);
	}
}
