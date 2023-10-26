import com.github.javafaker.Faker;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.sql.Date;
import java.util.Set;

public class Main {
    private static final UserDaoImpl dao = new UserDaoImpl();

    public static void main(String[] args) {
        List<User> users = generateUsers(1000);

        for (User user : users) {
            dao.insert(user);
        }
    }
    public static List<User> generateUsers(int count) {
        Faker faker = new Faker();
        List<User> users = new ArrayList<>();
        Set<String> generatedEmails = new HashSet<>();

        for (int i = 0; i < count; i++) {
            String lastName = faker.name().lastName();
            String firstName = faker.name().firstName();
            String middleName = faker.name().firstName();
            Date dateOfBirth = generateRandomBirthday();
            String professionId = generateProfessionId();
            String nationality = faker.nation().nationality();
            String phoneNumber = faker.phoneNumber().cellPhone();
            String email;

            do {
                email = faker.internet().emailAddress();
            } while (generatedEmails.contains(email)); // Проверка на уникальность email

            generatedEmails.add(email); // Добавление сгенерированного email в список
            User user = new User(lastName, firstName, middleName, dateOfBirth, professionId, nationality, phoneNumber, email);
            users.add(user);
        }

        return users;
    }

    public static Date generateRandomBirthday() {
        LocalDate startDate = LocalDate.of(1950, 1, 1);
        LocalDate endDate = LocalDate.of(2003, 12, 31);

        long startMillis = startDate.atStartOfDay(ZoneId.systemDefault()).toInstant().toEpochMilli();
        long endMillis = endDate.atStartOfDay(ZoneId.systemDefault()).toInstant().toEpochMilli();

        long randomMillisSinceEpoch = startMillis + (long) (Math.random() * (endMillis - startMillis + 1));

        return new Date(randomMillisSinceEpoch);
    }
    public static String generateProfessionId() {
        //в моем мире только 5 профессий..
        int id = (int) (Math.random() * 5);
        return String.valueOf(id);
    }
}
