import java.sql.Date;

public class User {
    private int id;
    private String lastName;
    private String firstName;
    private String middleName;
    private Date dateOfBirth;
    private String professionId;
    private String nationality;
    private String phoneNumber;
    private String email;

    public User(int id, String lastName, String firstName, String middleName, Date dateOfBirth, String professionId, String nationality, String phoneNumber, String email) {
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
        this.middleName = middleName;
        this.dateOfBirth = dateOfBirth;
        this.professionId = professionId;
        this.nationality = nationality;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getProfessionId() {
        return professionId;
    }

    public void setProfessionId(String professionId) {
        this.professionId = professionId;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User(String lastName, String firstName, String middleName, Date dateOfBirth, String professionId, String nationality, String phoneNumber, String email) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.middleName = middleName;
        this.dateOfBirth = dateOfBirth;
        this.professionId = professionId;
        this.nationality = nationality;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }
}
