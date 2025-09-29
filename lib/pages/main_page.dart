import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF0F0F0); // серый фон экрана
    const mint = Color(0xFFC2E6D9); // мятный фон карточки-экрана
    const title = Color(0xFF111827); // тёмный текст
    const subtitle = Color(0xFF6B7280); // вторичный текст
    const chipBg = Color(0xFFE6F2EC); // фон чипов Paystack
    const appliedBg = Color(0xFF12A05A); // Applied
    const expiresBg = Color(0xFFF4A61F); // Expires soon

    return Scaffold(
      backgroundColor: mint,
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          decoration: BoxDecoration(
            color: mint,
            borderRadius: BorderRadius.circular(28),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ---------- Header ----------
                Row(
                  children: [
                    const _Avatar(),
                    const Spacer(),
                    _SoftIcon(
                      icon: Icons.notifications_none_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ---------- SECTION: DESIGNER ----------
                const _SectionLabel(text: 'DESIGNER'),
                const SizedBox(height: 12),

                JobCard(
                  companyLogo: const _LogoBadge(),
                  titleText: 'Junior UX Designer',
                  companyText: 'Canva',
                  leftChip: const _Chip(text: 'Paystack'),
                  rightText: '\$40–60k/yearly',
                ),
                const SizedBox(height: 14),

                JobCard(
                  companyLogo: const _LogoBadge(),
                  titleText: 'Junior Product Designer',
                  companyText: 'Canva',
                  leftChip: const _Chip(text: 'Paystack'),
                  rightText: '\$40–60k/yearly',
                  statusChip: _StatusChip.applied(),
                ),
                const SizedBox(height: 14),

                JobCard(
                  companyLogo: const _LogoBadge(),
                  titleText: 'Middle motion Designer',
                  companyText: 'Canva',
                  leftChip: const _Chip(text: 'Paystack'),
                  rightText: '\$40–60k/yearly',
                  statusChip: _StatusChip.expiresSoon(),
                ),

                const SizedBox(height: 22),

                // ---------- SECTION: ANDROID ----------
                const _SectionLabel(text: 'ANDROID'),
                const SizedBox(height: 12),

                JobCard(
                  companyLogo: const _LogoBadge(),
                  titleText: 'Junior Android developer',
                  companyText: 'Kotlin, Java',
                  leftChip: const _Chip(text: 'Paystack'),
                  rightText: '\$40–60k/yearly',
                ),
                const SizedBox(height: 14),

                JobCard(
                  companyLogo: const _LogoBadge(),
                  titleText: 'Middle Android developer',
                  companyText: 'Kotlin, Java',
                  leftChip: const _Chip(text: 'Paystack'),
                  rightText: '\$40–60k/yearly',
                  statusChip: _StatusChip.expiresSoon(),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ===================== Small building blocks =====================

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/sample/avatar.jpg'), // при желании замени
        ),
      ),
    );
  }
}

class _SoftIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _SoftIcon({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(.55),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, size: 22, color: const Color(0xFF374151)),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          letterSpacing: 2.0,
          color: Color(0xFF607D77),
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge();

  @override
  Widget build(BuildContext context) {
    // круглая "C" с градиентом — как в макете
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5AC8FA), Color(0xFF7C4DFF)],
        ),
      ),
      child: const Center(
        child: Text(
          'C',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  const _Chip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F2EC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF4B7F70),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String text;
  final Color bg;
  final IconData? leading;

  const _StatusChip._(this.text, this.bg, this.leading, {super.key});

  _StatusChip.applied()
      : this._('Applied', Color(0xFF12A05A), Icons.check_circle);

  _StatusChip.expiresSoon()
      : this._('Expires Soon', Color(0xFFF4A61F), Icons.info);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) Icon(leading, size: 14, color: Colors.white),
          if (leading != null) const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ===================== Job card =====================

class JobCard extends StatelessWidget {
  final Widget companyLogo;
  final String titleText;
  final String companyText;
  final Widget leftChip;
  final String rightText;
  final Widget? statusChip;

  const JobCard({
    super.key,
    required this.companyLogo,
    required this.titleText,
    required this.companyText,
    required this.leftChip,
    required this.rightText,
    this.statusChip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0A0A0A).withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              companyLogo,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      companyText,
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (statusChip != null) ...[
                const SizedBox(width: 8),
                statusChip!,
              ],
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              leftChip,
              const Spacer(),
              Text(
                rightText,
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
