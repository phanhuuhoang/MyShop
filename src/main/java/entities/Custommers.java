package entities;
// Generated Nov 19, 2019 12:16:18 AM by Hibernate Tools 5.0.6.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Custommers generated by hbm2java
 */
@Entity
@Table(name = "custommers", catalog = "MyShop", uniqueConstraints = @UniqueConstraint(columnNames = "customer_email"))
public class Custommers implements java.io.Serializable {

	private String customerUsername;
	private String customerPass;
	private String customerEmail;
	private String customerFullname;
	private String customerAdress;
	private String customerPhone;

	public Custommers() {
	}

	public Custommers(String customerUsername, String customerPass, String customerEmail, String customerFullname,
			String customerAdress, String customerPhone) {
		this.customerUsername = customerUsername;
		this.customerPass = customerPass;
		this.customerEmail = customerEmail;
		this.customerFullname = customerFullname;
		this.customerAdress = customerAdress;
		this.customerPhone = customerPhone;
	}

	@Id

	@Column(name = "customer_username", unique = true, nullable = false)
	public String getCustomerUsername() {
		return this.customerUsername;
	}

	public void setCustomerUsername(String customerUsername) {
		this.customerUsername = customerUsername;
	}

	@Column(name = "customer_pass", nullable = false, length = 50)
	public String getCustomerPass() {
		return this.customerPass;
	}

	public void setCustomerPass(String customerPass) {
		this.customerPass = customerPass;
	}

	@Column(name = "customer_email", unique = true, nullable = false, length = 20)
	public String getCustomerEmail() {
		return this.customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	@Column(name = "customer_fullname", nullable = false)
	public String getCustomerFullname() {
		return this.customerFullname;
	}

	public void setCustomerFullname(String customerFullname) {
		this.customerFullname = customerFullname;
	}

	@Column(name = "customer_adress", nullable = false)
	public String getCustomerAdress() {
		return this.customerAdress;
	}

	public void setCustomerAdress(String customerAdress) {
		this.customerAdress = customerAdress;
	}

	@Column(name = "customer_phone", nullable = false, length = 11)
	public String getCustomerPhone() {
		return this.customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

}
