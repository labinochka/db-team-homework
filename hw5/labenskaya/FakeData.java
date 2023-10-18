package org.example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class FakeData {

    //language=sql
    public final static String SQL_SAVE = "insert into person(first_name, last_name, patronymic, date_of_birth, age," +
            "city, email, date_of_registration, profession, nationality, phone) values(?, ?, ?, cast(? as date) , ?, ?," +
            "?, cast(? as date), ?, ?, ?)";

    static PreparedStatement prepStatement;
    static final String DRIVER = "org.postgresql.Driver";
    static final String HOST = "jdbc:postgresql://localhost:5432/social_network_odnogruppniki";
    static final String USER = "postgres";
    static final String PASS = "password";

    static int count = 0;


    public static void main(String[] args) {

        try {
            Class.forName(DRIVER);
            Connection connection = DriverManager.getConnection(HOST, USER, PASS);
            prepStatement = connection.prepareStatement(SQL_SAVE);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        Faker faker = new Faker();
        for (int i = 0; i < 1000; i++) {
            String firstname = faker.name().firstName();
            String lastname = faker.name().lastName();
            String patronymic = faker.name().firstName();
            Date dateOfBirth = faker.date().birthday();
            int age = faker.number().numberBetween(14, 100);
            String city = faker.address().city();
            String email = faker.internet().emailAddress();
            Date dateOfRegistration = faker.date().between(
                    new Date(2023 - 1900, 9, 1), new Date(2023 - 1900, 10, 31));
            String profession = faker.job().title();
            String nationality = faker.nation().nationality();
            String phone = "+" + faker.phoneNumber().phoneNumber();
            save(firstname, lastname, patronymic, dateOfBirth, age, city, email, dateOfRegistration, profession,
                    nationality, phone);
        }
    }

    public static void save(String firstName, String lastName, String patronymic, Date dateOfBirth, int age, String city,
                            String email, Date dateOfRegistration, String profession, String nationality, String phone) {
        try {
            prepStatement.setString(1, firstName);
            prepStatement.setString(2, lastName);
            prepStatement.setString(3, patronymic);
            String dateBirthday = String.format("%s-%s-%s", dateOfBirth.getYear() + 1900, dateOfBirth.getMonth() + 1,
                    dateOfBirth.getDate() < 29 ? dateOfBirth.getDate() : dateOfBirth.getDate() - 3);
            prepStatement.setString(4, dateBirthday);
            prepStatement.setInt(5, age);
            prepStatement.setString(6, city);
            prepStatement.setString(7, email);
            String dateRegistration = String.format("%s-%s-%s", dateOfRegistration.getYear() + 1900,
                    dateOfRegistration.getMonth() + 1,
                    dateOfRegistration.getDate() < 30 ? dateOfRegistration.getDate() : dateOfRegistration.getDate() - 1);
            prepStatement.setString(8, dateRegistration);
            prepStatement.setString(9, profession);
            prepStatement.setString(10, nationality);
            prepStatement.setString(11, phone);
            prepStatement.executeUpdate();
            System.out.println(++count);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
