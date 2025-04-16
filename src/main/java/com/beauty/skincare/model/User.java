package com.beauty.skincare.model;


import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;

@Entity
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id")
    private Long id;

    @NotBlank(message = "Username is required")
    @Column(unique = true)
    private String username;

   
    @Size(min = 6, message = "Password must be at least 6 characters")
    private String password;

    
    private String name;

    @Email(message = "Enter a valid email")
   
    private String email;

    
    @Pattern(regexp = "^\\+?[0-9]{10,15}$", message = "Invalid contact number")
    private String contactNumber;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private UserRole role; // CUSTOMER, STAFF, MANAGER

   
  
}
