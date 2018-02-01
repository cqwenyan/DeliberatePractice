using System;
using ProtoBuf;

namespace TeamInterface
{
    [ProtoContract]
    [Sirenix.OdinInspector.ShowOdinSerializedPropertiesInInspector()]
    [Serializable]
    public class MagicTmpl
    {
        [ProtoMember(1)]
        public byte MagicType;
        [ProtoMember(2)]
        public int Id;
        [ProtoMember(3)]
        public int BaseDamge;
    }
}
