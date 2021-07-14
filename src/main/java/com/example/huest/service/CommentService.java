package com.example.huest.service;

import com.example.huest.DTO.CommentDTO;
import com.example.huest.DTO.PostDTO;
import com.example.huest.Form.CommentForm;
import com.example.huest.Repository.CommentRepository;
import com.example.huest.Repository.PostRepository;
import com.example.huest.Repository.UserRepository;
import com.example.huest.model.Comment;
import com.example.huest.model.Post;
import lombok.AllArgsConstructor;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class CommentService {
    public CommentRepository commentRepository;
    public PostRepository postRepository;
    public UserRepository userRepository;


    public List<CommentDTO> findAll(Integer id){
        return commentRepository.findAllByPostId(id).stream().map(CommentDTO::from).collect(Collectors.toList());
    }

    public void addComment(CommentForm commentForm){
        Comment comment = Comment.builder()
                .post(postRepository.findById(commentForm.getPost_id()).get())
                .text(commentForm.getText())
                .user_id(userRepository.findById(commentForm.getUser_id()).get())
                .build();
        commentRepository.save(comment);
    }

}
