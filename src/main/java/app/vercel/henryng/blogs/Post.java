package app.vercel.henryng.blogs;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;
import java.util.List;

@Document(collection = "posts_coll")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    @Id
    private ObjectId id;
    private String title;
    private String content;
    private String author;
    private List<String> tags;
    private Date createdAt;
    private Integer upVoteCount;
    private Integer downVoteCount;
}
