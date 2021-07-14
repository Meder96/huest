package com.example.huest.controller;

import com.example.huest.Form.CommentForm;
import com.example.huest.Form.PostForm;
import com.example.huest.Form.UserForm;
import com.example.huest.model.User;
import com.example.huest.service.CommentService;
import com.example.huest.service.PostService;
import com.example.huest.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.security.Principal;


@Controller
@AllArgsConstructor
public class PostController {
    public PostService postService;
    public UserService userService;
    public CommentService commentService;

    @GetMapping("/")
    public String posts(Model model, Principal principal){
        var userDTO = userService.findUserByName(principal.getName());
        model.addAttribute("post", postService.findAllByToday());
        model.addAttribute("user", userDTO);
        return "index";
    }

    @GetMapping("/users")
    public String users(Model model, Principal principal){
        var userDTO = userService.findUserByName(principal.getName());
        model.addAttribute("user", userDTO);
        return "users";
    }

    @PostMapping("/post/edit")
    public String editPost(PostForm postForm){
        postService.postEdit(postForm);
        return "redirect:/post/"+postForm.getId();
    }


    @GetMapping("/profile")
    public String userProfile(Model model, Principal principal){
        var userDTO = userService.findUserByName(principal.getName());
        model.addAttribute("user", userDTO);
        return "profile";
    }

    @GetMapping("/archieve")
    public String archieve(Model model, Principal principal){
        model.addAttribute("post", postService.findAllByDateIsFalse());
        var userDTO = userService.findUserByName(principal.getName());
        model.addAttribute("user", userDTO);
        return "archieve";
    }

    @GetMapping("/find/{name}")
    public String getFind(@PathVariable ("name") String name, Model model){
        var post = postService.find(name);
        model.addAttribute("post", post);
        return "find";
    }

    @GetMapping("/post/{id}")
    public String getPost(@PathVariable("id") int id, Model model, Principal principal){
        var userDTO = userService.findUserByName(principal.getName());
        var post = postService.findById(id);
        var comment = commentService.findAll(post.getId());
        model.addAttribute("user", userDTO);
        model.addAttribute("comment", comment);
        model.addAttribute("post", post);

        return "single";
    }

    @PostMapping("/addPost")
    public String addPost(PostForm postForm){
        postService.addPost(postForm);
        return "redirect:/";
    }

    @PostMapping("/addComment")
    public String addComment(CommentForm commentForm){
        commentService.addComment(commentForm);
        return "redirect:/post/"+commentForm.getPost_id();
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/addUser")
    public String addUser(@Valid UserForm userForm, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", "ERROR fields");
            return "redirect:/addUser";
        }
            userService.addUser(userForm);
            return "redirect:/";
    }

    @GetMapping("/addUser")
    public String credits(Model model, Principal principal){
        var userDTO = userService.findUserByName(principal.getName());
        model.addAttribute("user", userDTO);
        return "createUser";
    }

}
