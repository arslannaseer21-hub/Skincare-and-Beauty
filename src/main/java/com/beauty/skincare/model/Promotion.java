package com.beauty.skincare.model;
import jakarta.persistence.*;
import java.util.Date;
import lombok.*;

@Entity
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Promotion {
    @Id @GeneratedValue
    private int id;

    private String type; // e.g., birthday, festival
    private String description;
    private double discountPercent;
    private Date startDate;
    private Date endDate;
}
