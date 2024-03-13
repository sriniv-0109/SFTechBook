trigger accUserShareTrigger on Account (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        s_v44_accSharing_1.accountShare(Trigger.New);
    }

}