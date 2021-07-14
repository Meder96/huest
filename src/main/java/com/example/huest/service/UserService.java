package com.example.huest.service;

import com.example.huest.DTO.UserDTO;
import com.example.huest.Form.UserForm;
import com.example.huest.Repository.UserRepository;
import com.example.huest.model.User;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder encoder;

    public UserService(UserRepository userRepository, PasswordEncoder encoder) {
        this.userRepository = userRepository;
        this.encoder = encoder;
    }

    public void addUser(UserForm userForm){
        User user = User.builder()
                .name(userForm.getName())
                .password(encoder.encode(userForm.getPassword()))
        .build();
        userRepository.save(user);
    }

    public UserDTO findUserByName(String name){

        return UserDTO.from(userRepository.findUserByName(name).get());
    }

    public UserDTO findUserById(Integer id){

        return UserDTO.from((userRepository.findUserById(id).get()));
    }

}