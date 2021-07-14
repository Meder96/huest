package com.example.huest.Repository;

import com.example.huest.DTO.PostDTO;
import com.example.huest.model.Comment;
import com.example.huest.model.Post;
import com.example.huest.model.QPost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.querydsl.binding.QuerydslBinderCustomizer;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

public interface PostRepository extends JpaRepository<Post, Integer>{

//    List<Post> findAllByUser_id(Integer id);

    List<Post> findAllByDate(LocalDate date);

    List<Post> findAllByDateBefore(LocalDate date);

    List<Post> findByName(String name);
}
