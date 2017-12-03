Shader "Hidden/Shader/Common/BlendTestOp312"
{
    Properties {
        _DstTex ("DstTex", 2D) ="white"{}
        _SrcTex ("SrcTex", 2D) ="white"{}
    }
    SubShader {
        Pass{
            SetTexture[_DstTex] {combine texture}
        }
        Pass {
            BlendOp RevSub
            Blend Zero SrcColor
            SetTexture [_SrcTex] { combine texture}
        }
    }
}
