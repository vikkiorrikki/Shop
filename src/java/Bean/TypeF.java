package Bean;


import java.io.Serializable;

public class TypeF implements Serializable{

        private String id;
	private String name;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

    public TypeF(String id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public TypeF() {
        this.id = "0";
        this.name = "0";
    }     
}
