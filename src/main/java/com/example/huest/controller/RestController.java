package com.example.huest.controller;


import com.example.huest.DTO.PostDTO;
import com.example.huest.Repository.PostRepository;
import com.example.huest.Repository.UserRepository;
import com.example.huest.model.Post;
import com.example.huest.model.User;
import com.example.huest.service.PostService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@org.springframework.web.bind.annotation.RestController
@AllArgsConstructor
public class RestController {
private final PostService postService;
private final PostRepository postRepository;
private final UserRepository userRepository;

    @GetMapping("/table")
    private List<Post> getAllPosts(){
        return postRepository.findAll();
    }

    @GetMapping("/usersTable")
    private List<User> getAllUsers(){
        return userRepository.findAll();
    }


}
