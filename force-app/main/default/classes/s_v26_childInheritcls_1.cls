public class s_v26_childInheritcls_1 extends s_v26_inheritance_1 {
    public void getParentCls(){
        printName();    
       // printNation();
    }
    public override void printNation(){
        //super.printNation();
        system.debug('This is Nation from Child');
    }

}