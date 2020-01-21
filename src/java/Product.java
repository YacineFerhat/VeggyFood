/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ferhat Yacine
 */

public class Product {

        private int id;
	private String libelle;
	private double prix;
        private int qts;
        
	public Product() {
	}

	public Product(int id, String libelle, double prix, int qts) {
		this.id = id;
		this.libelle = libelle;
		this.prix = prix;
		this.qts = qts;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public int getQts() {
		return qts;
	}

	public void setPhoto(int qts) {
		this.qts = qts;
	}

}