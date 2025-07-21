package model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "AdminUser")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true, length = 100)
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false, length = 100)
    private String email;

    @Column(length = 100)
    private String fullName;

    @Column(length = 20)
    private String role = "ADMIN";

    private boolean active = true;
}