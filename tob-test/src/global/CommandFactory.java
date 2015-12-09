package global;

public class CommandFactory {
	public Command createCommand(String directory, String page){
		System.out.println("팩토리 내부 directory : " +directory);
		System.out.println("팩토리 내부 page : " +page);
		return new Command(directory, page);
	}
}
