    private int curATK;
    private int curAtkKey;
    public int CurATK
    {
        get
        {
            return curATK ^ curAtkKey;
        }
        set
        {
            curAtkKey = Random.Range(0, 0xffff);
            curATK = value ^ curAtkKey;
        }
    }

    private int curHP;
    private int curRealHP;
    private int curHPKey;
    public int CurATK1
    {
        get
        {
            if (curRealHP != (curHP ^ curHPKey))
                Debug.Log("cheat! report to server...");
            return curHP ^ curHPKey;
        }
        set
        {
            curRealHP = value;
            curHPKey = Random.Range(0, 0xffff);
            curHP = value ^ curHPKey;
        }
    }
