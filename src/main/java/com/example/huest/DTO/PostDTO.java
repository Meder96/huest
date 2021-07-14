package com.example.huest.DTO;

import com.example.huest.model.Post;
import com.example.huest.model.User;
import lombok.*;

import java.time.LocalDate;
@Data
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class PostDTO {

    private Integer id;
    private String name;
    private String description;
    private User user_id;
    private LocalDate date;

    public static PostDTO from (Post post){
        return PostDTO.builder()
                .id(post.getId())
                .name(post.getName())
                .description(post.getDescription())
                .user_id(post.getUser_id())
                .date(post.getDate())
                .build();
    }
}
