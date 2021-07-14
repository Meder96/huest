package com.example.huest.service;

import com.example.huest.DTO.PostDTO;
import com.example.huest.Form.PostForm;
import com.example.huest.Repository.PostRepository;
import com.example.huest.Repository.UserRepository;
import com.example.huest.model.Post;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class PostService {
    public PostRepository postRepository;
    public UserRepository userRepository;

    public void addPost(PostForm postForm){
        Post post = Post.builder()
                .name(postForm.getName())
                .description(postForm.getDescription())
                .user_id(userRepository.findById(postForm.getUser_id()).get())
                .date(LocalDate.now())
                .build();
        postRepository.save(post);
    }

    public PostDTO findById(Integer id){
        return PostDTO.from(postRepository.findById(id).get());
    }

    public List<PostDTO> findAllByToday(){
        return postRepository.findAllByDate(LocalDate.now()).stream().map(PostDTO::from).collect(Collectors.toList());
    }

    public List<Post> findAllByDateIsFalse(){
        return postRepository.findAllByDateBefore(LocalDate.now());
    }

    public void postEdit(PostForm postForm){
    Post post = postRepository.findById(postForm.getId()).get();

    post.setName(postForm.getName());
    post.setDescription(postForm.getDescription());
    post.setDate(LocalDate.now());
    postRepository.save(post);
    }

    public List<Post> find(String name){

        List<Post> posts = postRepository.findAll();
        List<Post> thisPlaces = new ArrayList<>();
        for(Post post: posts){
            if(post.getName().toLowerCase().contains(name.toLowerCase())){
                thisPlaces.add(post);
            }else if(post.getDescription().toLowerCase().contains(name.toLowerCase())){
                thisPlaces.add(post);
            }
            else if(post.getUser_id().getName().contains(name.toLowerCase())){
                thisPlaces.add(post);
            }
        }
        return thisPlaces;
    }

}
