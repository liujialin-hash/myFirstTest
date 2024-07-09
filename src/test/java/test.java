/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.dom.xml.Attribute;
import org.mybatis.generator.api.dom.xml.Document;
import org.mybatis.generator.api.dom.xml.TextElement;
import org.mybatis.generator.api.dom.xml.XmlElement;

public class test {


    public static void main(String[] args)  {
        String aa = "\n" +
                "Content-Disposition: form-data; name=\"newsPig\"; filename=\"屏幕截图 2024-07-08 143851.png\"\n" +
                "Content-Type: image/png\n" +
                "\n" +
                "�PNG\n" +
                "\u001A\n" +
                "   \n" +
                "IHDR  \u0001�  \u0001�\b\u0006   |j��   \u0001sRGB ��\u001C�   \u0004gAMA  ��\u000B�a\u0005   \tpHYs  \u0012t  \u0012t\u0001�f\u001Fx  ��IDATx^��G�dI��\u001D���=\"<8͈�*�LWw�L�LOC�Y \"\u0010l��\u0002\u001B`� \u0002,�\u0004+\b6�@\u0010pl � ��\u0007\f�iR�]U�3�s7�\n" +
                "��9Wͮ��GdddLW��\u0013q]�)=zT�\u0010e��\u007F�w_O\u000B���\u0007��^\f\u0017���a��o\"����M�����o��|O�!�wQ\u001E����/�'e�\b�D�\t��zjE\u007F/�\u001F��`Bx�d���\u0006D����WlX(Y�ݳg����3��a��ݑ\n" +
                "�ڴ�\u001C�6\u0019*�Ȭ����e)\u001B&�9V�I��%Qf@��+ށ�O��D80֊Ey\u0014&6\u001E�m4�٠ߴ������U�~���HϱY�7���S[��)�ҏUҴ�|�FC\n" +
                ")Z�T��^�\n" +
                "T?w�\u0007<pU�C>l�\u001A�o'�Fx�¨�읟Y��~�>\u0019\u0013�\u0005����C�?�r\u0019�J�\u007F�Ԋ垽��5��?]�bͬ�2{���Z���\n" +
                "�J�v�*\u0007���'�����[}�V�T��\t\u007F�xaS�O\\��zd�?\t���3n�n<\u001AY�R6ȮW=j=�O���My��U�\u001F�I�X�ѶK�����\u0015�q�����`\u007F��Ԇ��J\\�a�l���Z�\n" +
                "�m[]+�՛[���+v�Y�j����'}ѭjG�-k��V����ڊ���``�������������5�z�h�[QU���w\u0007c�4��c`������p\u0015R*�T�U��m��:�7�\u001E(SJ���-ŋ����^��{[f~S:�x��1������\n" +
                "��Y��͢~�\u0010�jYI4\\��w���7�N�É�{#�\u001E��R���G�\u0005�OJ*O\t)Q��\u0557i�\u0002a�\n" +
                "\u0007�I���\u001Cs���X���\u0007Q�Y^����\n" +
                "^\u0017�?��?k��&\u00196���?\u001D�u����Ey�!�\u0004��t�|W`@�\u0005zQ�QtN\u001E}z\\,Z�*6��\u0019���\u0017C�(͉\u0004�~�c��t\u001E���'5�\fJV\u001C�a�$4զ��.hȪ�?\u00151�\u0010�b�*r(\u001AP>\u0002?� 4Q@D���\u0016C�@�\"��� ��Y�%��v��U{�m1h%\u007F�جݞZO��H�zm�j�&B\b\u0005`ⵂ\u0019�v�!\fp�)��3(�\u001EO=\u0011<��G�\b@W���� �\u001E�L\u0010@V\u0004\u0006� ��s�\u001E�)�V\u000B�\u001B�J\u0019��n�\u07B4_��\u0007.ܚ\u0012�ϞK �\u001D�pT�riEL��G�H�\u001A\u0017\u0006�\u007F,!%)�r�\"�e�\n" +
                "0g��(R\u0012��\u0017��o\u0012��\u0003��\u001B�Oh*\t���\u000E�_��?9=\u0015��m��}��M�vKx7$��\u001D�\uD944\uDD2E��h$%OI��5\u001A���c[ߪڃ�o\u06DD�E۽��\u000E�|b��o$�p4�٤/�+|�`���z\u000E�XiK0\u0016l��mmm�Ύ\u0014\u0001\t�^Oe��\u0011����@ڝ2@�1)��\t���\u0014<�{�>4q�-kG�צ�Hu�ȡ�7}K�_��#�?j����&��������lk{�v�$��$k\u0012��NZ�x)3f�6t\u0018�\u001E\u0012�R�\u0006�?�\u001B\bW\n" +
                " ��o�\u0007��\u000F�\u0004��+l�\u0017���\u001FފO�R%~�O\u0016\u0004E���Oy.C\bc�H�\u0006�k\t\n" +
                "tpa\u0012���y�?\n" ;
        String[] split = aa.split("filename=\"");
        String[] split1 = split[1].split("\"");
        String s = split1[0];

        System.out.println(s);
    }
}
