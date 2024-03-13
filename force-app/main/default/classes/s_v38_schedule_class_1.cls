global class s_v38_schedule_class_1 implements system.schedulable{
    global void execute(system.schedulableContext sc){
        s_v38_schedule_batchAccDel_1 batch=new s_v38_schedule_batchAccDel_1();
        Database.executeBatch(batch);
    }

}