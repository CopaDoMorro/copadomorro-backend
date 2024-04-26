package br.com.copadomorro.copadomorro.dto;

import br.com.copadomorro.copadomorro.entity.User;
import br.com.copadomorro.copadomorro.entity.enums.TypeUserEnum;
import org.springframework.beans.BeanUtils;

public class UserDTO {

    private Long id;
    private String name;
    private String email;
    private String password;
    private String cpf;
    private String cnpj;
    private TypeUserEnum type;

    public UserDTO(User user) {
        BeanUtils.copyProperties(user, this);
    }

    public UserDTO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public TypeUserEnum getType() {
        return type;
    }

    public void setType(TypeUserEnum type) {
        this.type = type;
    }
}
