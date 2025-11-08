package com.quynhontours.model;

public class User {
    private String firstName;
    private String lastName;
    private String email;
    private String dob;
    private String password;
    private String role; // "admin" hoặc "user"

    public User() {}

    public User(String firstName, String lastName, String email, String dob, String password, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dob = dob;
        this.password = password;
        this.role = role;
    }

    // Getter & Setter
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
