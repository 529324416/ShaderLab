Shader "Hidden/Shader/Common/BlendTestOp084"
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
            BlendOp Max
            Blend OneMinusDstColor DstColor
            SetTexture [_SrcTex] { combine texture}
        }
    }
}
