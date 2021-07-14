package com.example.huest.DTO;

import com.example.huest.model.Comment;
import com.example.huest.model.Post;
import com.example.huest.model.User;
import lombok.*;

@Data
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class CommentDTO {
    private Integer id;
    private String text;
    private Post post;
    private User user_id;

    public static CommentDTO from (Comment comment){
        return CommentDTO.builder()
                .id(comment.getId())
                .text(comment.getText())
                .post(comment.getPost())
                .user_id(comment.getUser_id())
                .build();
    }
}
